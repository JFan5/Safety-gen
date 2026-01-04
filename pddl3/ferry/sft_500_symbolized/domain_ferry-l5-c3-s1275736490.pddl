(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_3 ?v5)
		(pred_2 ?v6)
		(pred_4 ?v6)
		(pred_6 ?v5 ?v6)
		(pred_5)
		(pred_1 ?v5))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_2 ?v7) (pred_2 ?v8) (pred_4 ?v7))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v7))))


   (:action op_1
       :parameters (?v2 ?v1)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v1)
			    (pred_6 ?v2 ?v1) (pred_4 ?v1) (pred_5))
       :effect (and (pred_1 ?v2)
		    (not (pred_6 ?v2 ?v1)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v2  ?v1)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v1)
			    (pred_1 ?v2) (pred_4 ?v1))
       :effect (and (pred_6 ?v2 ?v1)
		    (pred_5)
		    (not (pred_1 ?v2)))))
