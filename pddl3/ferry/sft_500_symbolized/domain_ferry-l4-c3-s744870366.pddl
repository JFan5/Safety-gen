(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_6 ?v6)
		(pred_5 ?v4)
		(pred_4 ?v4)
		(pred_1 ?v6 ?v4)
		(pred_3)
		(pred_2 ?v6))

   (:action op_1
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_5 ?v3) (pred_5 ?v8) (pred_4 ?v3))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v7)
			    (pred_1 ?v1 ?v7) (pred_4 ?v7) (pred_3))
       :effect (and (pred_2 ?v1)
		    (not (pred_1 ?v1 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v7)
			    (pred_2 ?v1) (pred_4 ?v7))
       :effect (and (pred_1 ?v1 ?v7)
		    (pred_3)
		    (not (pred_2 ?v1)))))
