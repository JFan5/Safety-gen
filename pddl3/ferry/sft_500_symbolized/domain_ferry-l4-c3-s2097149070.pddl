(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v6)
		(pred_6 ?v3)
		(pred_1 ?v4)
		(pred_5 ?v4)
		(pred_4 ?v3 ?v4)
		(pred_3)
		(pred_2 ?v3))

   (:action op_1
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_1 ?v7) (pred_1 ?v8) (pred_5 ?v7))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v7))))


   (:action op_2
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v2)
			    (pred_4 ?v5 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v2)
			    (pred_2 ?v5) (pred_5 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_3)
		    (not (pred_2 ?v5)))))
