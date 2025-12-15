(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_4 ?v8)
		(pred_2 ?v4)
		(pred_3 ?v4)
		(pred_6 ?v8 ?v4)
		(pred_5)
		(pred_1 ?v8))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_2 ?v3) (pred_2 ?v1) (pred_3 ?v3))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v3))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_4 ?v7) (pred_2 ?v6)
			    (pred_6 ?v7 ?v6) (pred_3 ?v6) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_4 ?v7) (pred_2 ?v6)
			    (pred_1 ?v7) (pred_3 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_5)
		    (not (pred_1 ?v7)))))
