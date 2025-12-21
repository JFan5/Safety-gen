(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_1 ?v3)
		(pred_6 ?v7)
		(pred_5 ?v7)
		(pred_2 ?v3 ?v7)
		(pred_4)
		(pred_3 ?v3))

   (:action op_3
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_6 ?v4) (pred_6 ?v5) (pred_5 ?v4))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v4))))


   (:action op_1
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v6)
			    (pred_2 ?v8 ?v6) (pred_5 ?v6) (pred_4))
       :effect (and (pred_3 ?v8)
		    (not (pred_2 ?v8 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v6)
			    (pred_3 ?v8) (pred_5 ?v6))
       :effect (and (pred_2 ?v8 ?v6)
		    (pred_4)
		    (not (pred_3 ?v8)))))
