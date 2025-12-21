(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_3 ?v6)
		(pred_2 ?v5)
		(pred_1 ?v5)
		(pred_6 ?v6 ?v5)
		(pred_5)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_2 ?v4) (pred_2 ?v2) (pred_1 ?v4))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v4))))


   (:action op_1
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v7)
			    (pred_6 ?v3 ?v7) (pred_1 ?v7) (pred_5))
       :effect (and (pred_4 ?v3)
		    (not (pred_6 ?v3 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v7)
			    (pred_4 ?v3) (pred_1 ?v7))
       :effect (and (pred_6 ?v3 ?v7)
		    (pred_5)
		    (not (pred_4 ?v3)))))
