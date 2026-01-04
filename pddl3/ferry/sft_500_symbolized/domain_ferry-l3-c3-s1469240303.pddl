(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_2 ?v5)
		(pred_5 ?v3)
		(pred_1 ?v3)
		(pred_4 ?v5 ?v3)
		(pred_6)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_5 ?v4) (pred_5 ?v7) (pred_1 ?v4))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v4))))


   (:action op_1
       :parameters (?v2 ?v8)
       :precondition  (and  (pred_2 ?v2) (pred_5 ?v8)
			    (pred_4 ?v2 ?v8) (pred_1 ?v8) (pred_6))
       :effect (and (pred_3 ?v2)
		    (not (pred_4 ?v2 ?v8)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v2  ?v8)
       :precondition  (and  (pred_2 ?v2) (pred_5 ?v8)
			    (pred_3 ?v2) (pred_1 ?v8))
       :effect (and (pred_4 ?v2 ?v8)
		    (pred_6)
		    (not (pred_3 ?v2)))))
