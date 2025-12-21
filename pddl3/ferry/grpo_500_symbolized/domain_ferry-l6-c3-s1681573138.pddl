(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_1 ?v1)
		(pred_3 ?v8)
		(pred_4 ?v8)
		(pred_2 ?v1 ?v8)
		(pred_5)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_3 ?v3) (pred_3 ?v5) (pred_4 ?v3))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v7)
			    (pred_2 ?v6 ?v7) (pred_4 ?v7) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v7)
			    (pred_6 ?v6) (pred_4 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_5)
		    (not (pred_6 ?v6)))))
