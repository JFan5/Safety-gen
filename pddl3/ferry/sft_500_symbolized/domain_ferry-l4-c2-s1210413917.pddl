(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_6 ?v3)
		(pred_1 ?v5)
		(pred_5 ?v5)
		(pred_2 ?v3 ?v5)
		(pred_3)
		(pred_4 ?v3))

   (:action op_3
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_1 ?v4) (pred_1 ?v6) (pred_5 ?v4))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v4))))


   (:action op_1
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_6 ?v8) (pred_1 ?v7)
			    (pred_2 ?v8 ?v7) (pred_5 ?v7) (pred_3))
       :effect (and (pred_4 ?v8)
		    (not (pred_2 ?v8 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_6 ?v8) (pred_1 ?v7)
			    (pred_4 ?v8) (pred_5 ?v7))
       :effect (and (pred_2 ?v8 ?v7)
		    (pred_3)
		    (not (pred_4 ?v8)))))
