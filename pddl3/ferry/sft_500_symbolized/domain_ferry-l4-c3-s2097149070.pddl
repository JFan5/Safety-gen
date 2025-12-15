(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_4 ?v1)
		(pred_5 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v1 ?v5)
		(pred_1)
		(pred_6 ?v1))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_5 ?v2) (pred_5 ?v6) (pred_3 ?v2))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v2))))


   (:action op_3
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v7)
			    (pred_2 ?v3 ?v7) (pred_3 ?v7) (pred_1))
       :effect (and (pred_6 ?v3)
		    (not (pred_2 ?v3 ?v7)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v7)
			    (pred_6 ?v3) (pred_3 ?v7))
       :effect (and (pred_2 ?v3 ?v7)
		    (pred_1)
		    (not (pred_6 ?v3)))))
