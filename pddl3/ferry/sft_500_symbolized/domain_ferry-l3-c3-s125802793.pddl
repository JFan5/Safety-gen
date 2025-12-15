(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_4 ?v2)
		(pred_5 ?v1)
		(pred_2 ?v1)
		(pred_3 ?v2 ?v1)
		(pred_6)
		(pred_1 ?v2))

   (:action op_3
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_5 ?v3) (pred_5 ?v6) (pred_2 ?v3))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v3))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v7)
			    (pred_3 ?v8 ?v7) (pred_2 ?v7) (pred_6))
       :effect (and (pred_1 ?v8)
		    (not (pred_3 ?v8 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v7)
			    (pred_1 ?v8) (pred_2 ?v7))
       :effect (and (pred_3 ?v8 ?v7)
		    (pred_6)
		    (not (pred_1 ?v8)))))
