(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_4 ?v6)
		(pred_2 ?v7)
		(pred_5 ?v7)
		(pred_1 ?v6 ?v7)
		(pred_3)
		(pred_6 ?v6))

   (:action op_3
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_2 ?v8) (pred_2 ?v5) (pred_5 ?v8))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v4)
			    (pred_1 ?v2 ?v4) (pred_5 ?v4) (pred_3))
       :effect (and (pred_6 ?v2)
		    (not (pred_1 ?v2 ?v4)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v4)
			    (pred_6 ?v2) (pred_5 ?v4))
       :effect (and (pred_1 ?v2 ?v4)
		    (pred_3)
		    (not (pred_6 ?v2)))))
