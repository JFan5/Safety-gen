(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_1 ?v4)
		(pred_4 ?v7)
		(pred_5 ?v7)
		(pred_2 ?v4 ?v7)
		(pred_3)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v8 ?v6)
       :precondition (and (not-eq ?v8 ?v6) 
                          (pred_4 ?v8) (pred_4 ?v6) (pred_5 ?v8))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v2)
			    (pred_2 ?v3 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_6 ?v3)
		    (not (pred_2 ?v3 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v2)
			    (pred_6 ?v3) (pred_5 ?v2))
       :effect (and (pred_2 ?v3 ?v2)
		    (pred_3)
		    (not (pred_6 ?v3)))))
