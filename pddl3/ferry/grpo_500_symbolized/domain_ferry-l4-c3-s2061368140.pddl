(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_4 ?v8)
		(pred_2 ?v6)
		(pred_1 ?v6)
		(pred_3 ?v8 ?v6)
		(pred_5)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_2 ?v7) (pred_2 ?v4) (pred_1 ?v7))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v7))))


   (:action op_2
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_4 ?v1) (pred_2 ?v5)
			    (pred_3 ?v1 ?v5) (pred_1 ?v5) (pred_5))
       :effect (and (pred_6 ?v1)
		    (not (pred_3 ?v1 ?v5)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_4 ?v1) (pred_2 ?v5)
			    (pred_6 ?v1) (pred_1 ?v5))
       :effect (and (pred_3 ?v1 ?v5)
		    (pred_5)
		    (not (pred_6 ?v1)))))
