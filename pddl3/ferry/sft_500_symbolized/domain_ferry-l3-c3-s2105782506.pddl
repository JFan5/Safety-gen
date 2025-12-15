(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_2 ?v4)
		(pred_4 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v4 ?v1)
		(pred_3)
		(pred_5 ?v4))

   (:action op_3
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_4 ?v7) (pred_4 ?v6) (pred_6 ?v7))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v3)
			    (pred_1 ?v5 ?v3) (pred_6 ?v3) (pred_3))
       :effect (and (pred_5 ?v5)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v3)
			    (pred_5 ?v5) (pred_6 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_3)
		    (not (pred_5 ?v5)))))
