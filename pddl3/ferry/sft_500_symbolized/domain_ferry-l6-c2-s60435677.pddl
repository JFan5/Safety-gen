(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_4 ?v1)
		(pred_6 ?v6)
		(pred_3 ?v6)
		(pred_1 ?v1 ?v6)
		(pred_5)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_6 ?v2) (pred_6 ?v4) (pred_3 ?v2))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v2))))


   (:action op_3
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_6 ?v7)
			    (pred_1 ?v3 ?v7) (pred_3 ?v7) (pred_5))
       :effect (and (pred_2 ?v3)
		    (not (pred_1 ?v3 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_6 ?v7)
			    (pred_2 ?v3) (pred_3 ?v7))
       :effect (and (pred_1 ?v3 ?v7)
		    (pred_5)
		    (not (pred_2 ?v3)))))
