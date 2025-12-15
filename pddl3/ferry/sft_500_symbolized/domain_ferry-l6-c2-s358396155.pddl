(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_3 ?v4)
		(pred_6 ?v3)
		(pred_1 ?v3)
		(pred_2 ?v4 ?v3)
		(pred_5)
		(pred_4 ?v4))

   (:action op_3
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_6 ?v5) (pred_6 ?v6) (pred_1 ?v5))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v5))))


   (:action op_1
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v2)
			    (pred_2 ?v7 ?v2) (pred_1 ?v2) (pred_5))
       :effect (and (pred_4 ?v7)
		    (not (pred_2 ?v7 ?v2)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v2)
			    (pred_4 ?v7) (pred_1 ?v2))
       :effect (and (pred_2 ?v7 ?v2)
		    (pred_5)
		    (not (pred_4 ?v7)))))
