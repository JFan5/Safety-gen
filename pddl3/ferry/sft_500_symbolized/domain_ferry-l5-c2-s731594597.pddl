(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_2 ?v6)
		(pred_5 ?v1)
		(pred_1 ?v1)
		(pred_3 ?v6 ?v1)
		(pred_4)
		(pred_6 ?v6))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_5 ?v3) (pred_5 ?v2) (pred_1 ?v3))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v3))))


   (:action op_3
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v7)
			    (pred_3 ?v8 ?v7) (pred_1 ?v7) (pred_4))
       :effect (and (pred_6 ?v8)
		    (not (pred_3 ?v8 ?v7)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_2 ?v8) (pred_5 ?v7)
			    (pred_6 ?v8) (pred_1 ?v7))
       :effect (and (pred_3 ?v8 ?v7)
		    (pred_4)
		    (not (pred_6 ?v8)))))
