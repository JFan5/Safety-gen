(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_4 ?v4)
		(pred_5 ?v5)
		(pred_3 ?v5)
		(pred_6 ?v4 ?v5)
		(pred_2)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_5 ?v8) (pred_5 ?v3) (pred_3 ?v8))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v8))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v7)
			    (pred_6 ?v6 ?v7) (pred_3 ?v7) (pred_2))
       :effect (and (pred_1 ?v6)
		    (not (pred_6 ?v6 ?v7)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v7)
			    (pred_1 ?v6) (pred_3 ?v7))
       :effect (and (pred_6 ?v6 ?v7)
		    (pred_2)
		    (not (pred_1 ?v6)))))
