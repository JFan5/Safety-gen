(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_3 ?v6)
		(pred_6 ?v8)
		(pred_5 ?v8)
		(pred_2 ?v6 ?v8)
		(pred_1)
		(pred_4 ?v6))

   (:action op_2
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_6 ?v3) (pred_6 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_1
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_3 ?v2) (pred_6 ?v7)
			    (pred_2 ?v2 ?v7) (pred_5 ?v7) (pred_1))
       :effect (and (pred_4 ?v2)
		    (not (pred_2 ?v2 ?v7)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_3 ?v2) (pred_6 ?v7)
			    (pred_4 ?v2) (pred_5 ?v7))
       :effect (and (pred_2 ?v2 ?v7)
		    (pred_1)
		    (not (pred_4 ?v2)))))
