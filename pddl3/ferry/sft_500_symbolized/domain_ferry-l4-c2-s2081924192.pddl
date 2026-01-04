(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_6 ?v4)
		(pred_3 ?v3)
		(pred_2 ?v3)
		(pred_4 ?v4 ?v3)
		(pred_5)
		(pred_1 ?v4))

   (:action op_3
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_3 ?v7) (pred_3 ?v2) (pred_2 ?v7))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v7))))


   (:action op_2
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_6 ?v1) (pred_3 ?v5)
			    (pred_4 ?v1 ?v5) (pred_2 ?v5) (pred_5))
       :effect (and (pred_1 ?v1)
		    (not (pred_4 ?v1 ?v5)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_6 ?v1) (pred_3 ?v5)
			    (pred_1 ?v1) (pred_2 ?v5))
       :effect (and (pred_4 ?v1 ?v5)
		    (pred_5)
		    (not (pred_1 ?v1)))))
