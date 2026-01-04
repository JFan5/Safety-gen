(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_5 ?v2)
		(pred_6 ?v3)
		(pred_3 ?v3)
		(pred_1 ?v2 ?v3)
		(pred_2)
		(pred_4 ?v2))

   (:action op_1
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_6 ?v7) (pred_6 ?v6) (pred_3 ?v7))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v7))))


   (:action op_2
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v1)
			    (pred_1 ?v5 ?v1) (pred_3 ?v1) (pred_2))
       :effect (and (pred_4 ?v5)
		    (not (pred_1 ?v5 ?v1)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v1)
			    (pred_4 ?v5) (pred_3 ?v1))
       :effect (and (pred_1 ?v5 ?v1)
		    (pred_2)
		    (not (pred_4 ?v5)))))
