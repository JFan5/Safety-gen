(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_3 ?v6)
		(pred_6 ?v3)
		(pred_5 ?v3)
		(pred_2 ?v6 ?v3)
		(pred_4)
		(pred_1 ?v6))

   (:action op_3
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_6 ?v5) (pred_6 ?v7) (pred_5 ?v5))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v5))))


   (:action op_2
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v2)
			    (pred_2 ?v8 ?v2) (pred_5 ?v2) (pred_4))
       :effect (and (pred_1 ?v8)
		    (not (pred_2 ?v8 ?v2)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v2)
			    (pred_1 ?v8) (pred_5 ?v2))
       :effect (and (pred_2 ?v8 ?v2)
		    (pred_4)
		    (not (pred_1 ?v8)))))
