(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_3 ?v5)
		(pred_6 ?v4)
		(pred_5 ?v4)
		(pred_1 ?v5 ?v4)
		(pred_4)
		(pred_2 ?v5))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_6 ?v3) (pred_6 ?v1) (pred_5 ?v3))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v3))))


   (:action op_3
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v6)
			    (pred_1 ?v8 ?v6) (pred_5 ?v6) (pred_4))
       :effect (and (pred_2 ?v8)
		    (not (pred_1 ?v8 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v6)
			    (pred_2 ?v8) (pred_5 ?v6))
       :effect (and (pred_1 ?v8 ?v6)
		    (pred_4)
		    (not (pred_2 ?v8)))))
