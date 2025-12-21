(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_2 ?v2)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_1 ?v2 ?v5)
		(pred_3)
		(pred_6 ?v2))

   (:action op_2
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_5 ?v8) (pred_5 ?v4) (pred_4 ?v8))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v8))))


   (:action op_3
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_1 ?v1 ?v6) (pred_4 ?v6) (pred_3))
       :effect (and (pred_6 ?v1)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_6 ?v1) (pred_4 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_3)
		    (not (pred_6 ?v1)))))
