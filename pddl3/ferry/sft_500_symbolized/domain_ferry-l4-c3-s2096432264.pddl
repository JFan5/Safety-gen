(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_6 ?v7)
		(pred_1 ?v6)
		(pred_3 ?v6)
		(pred_2 ?v7 ?v6)
		(pred_4)
		(pred_5 ?v7))

   (:action op_1
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_1 ?v8) (pred_1 ?v5) (pred_3 ?v8))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v8))))


   (:action op_2
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v4)
			    (pred_2 ?v3 ?v4) (pred_3 ?v4) (pred_4))
       :effect (and (pred_5 ?v3)
		    (not (pred_2 ?v3 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_1 ?v4)
			    (pred_5 ?v3) (pred_3 ?v4))
       :effect (and (pred_2 ?v3 ?v4)
		    (pred_4)
		    (not (pred_5 ?v3)))))
