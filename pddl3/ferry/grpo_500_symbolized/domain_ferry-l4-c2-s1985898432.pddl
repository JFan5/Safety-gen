(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_4 ?v2)
		(pred_1 ?v3)
		(pred_3 ?v3)
		(pred_2 ?v2 ?v3)
		(pred_6)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_1 ?v1) (pred_1 ?v4) (pred_3 ?v1))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v1))))


   (:action op_3
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v8)
			    (pred_2 ?v7 ?v8) (pred_3 ?v8) (pred_6))
       :effect (and (pred_5 ?v7)
		    (not (pred_2 ?v7 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v8)
			    (pred_5 ?v7) (pred_3 ?v8))
       :effect (and (pred_2 ?v7 ?v8)
		    (pred_6)
		    (not (pred_5 ?v7)))))
