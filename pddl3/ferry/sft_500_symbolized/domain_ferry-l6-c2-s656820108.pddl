(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_2 ?v7)
		(pred_3 ?v1)
		(pred_1 ?v1)
		(pred_5 ?v7 ?v1)
		(pred_4)
		(pred_6 ?v7))

   (:action op_3
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_3 ?v8) (pred_3 ?v4) (pred_1 ?v8))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_2 ?v5) (pred_3 ?v6)
			    (pred_5 ?v5 ?v6) (pred_1 ?v6) (pred_4))
       :effect (and (pred_6 ?v5)
		    (not (pred_5 ?v5 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_2 ?v5) (pred_3 ?v6)
			    (pred_6 ?v5) (pred_1 ?v6))
       :effect (and (pred_5 ?v5 ?v6)
		    (pred_4)
		    (not (pred_6 ?v5)))))
