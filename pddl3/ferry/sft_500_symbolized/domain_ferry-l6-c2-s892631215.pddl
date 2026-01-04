(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_3 ?v2)
		(pred_4 ?v6)
		(pred_2 ?v6)
		(pred_5 ?v2 ?v6)
		(pred_6)
		(pred_1 ?v2))

   (:action op_3
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_4 ?v1) (pred_4 ?v5) (pred_2 ?v1))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v1))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_4 ?v7)
			    (pred_5 ?v8 ?v7) (pred_2 ?v7) (pred_6))
       :effect (and (pred_1 ?v8)
		    (not (pred_5 ?v8 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_4 ?v7)
			    (pred_1 ?v8) (pred_2 ?v7))
       :effect (and (pred_5 ?v8 ?v7)
		    (pred_6)
		    (not (pred_1 ?v8)))))
