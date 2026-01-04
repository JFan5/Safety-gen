(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_4 ?v6)
		(pred_5 ?v1)
		(pred_6 ?v1)
		(pred_2 ?v6 ?v1)
		(pred_1)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_5 ?v3) (pred_5 ?v7) (pred_6 ?v3))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v3))))


   (:action op_2
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v8)
			    (pred_2 ?v4 ?v8) (pred_6 ?v8) (pred_1))
       :effect (and (pred_3 ?v4)
		    (not (pred_2 ?v4 ?v8)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v8)
			    (pred_3 ?v4) (pred_6 ?v8))
       :effect (and (pred_2 ?v4 ?v8)
		    (pred_1)
		    (not (pred_3 ?v4)))))
