(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v12)
             (pred_3 ?v3 ?v9)
             (pred_11 ?v7 ?v9)
             (pred_2 ?v1 ?v7 )
	     (pred_6 ?v7)
             (pred_9 ?v2)
             (pred_8 ?v3)
             (pred_1 ?v9)
             (pred_5 ?v7)
             (pred_12 ?v3)
             (pred_4 ?v7)
             (pred_7 ))



(:action op_1
:parameters (?v13 ?v10 ?v4 ?v6)
:precondition (and (pred_9 ?v13) (pred_9 ?v10) (pred_8 ?v4) (pred_1 ?v6)
          (pred_10 ?v13 ?v10) (pred_3 ?v4 ?v6)
                   (pred_11 ?v10 ?v6) (pred_6 ?v13) 
                   (pred_5 ?v10) (pred_12 ?v4))
:effect (and  (pred_4 ?v10) (not (pred_5 ?v10))))


(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_9 ?v8)
               (pred_6 ?v13) (pred_10 ?v13 ?v8) (pred_4 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_9 ?v13) (pred_8 ?v4) 
                  (pred_6 ?v13) (pred_2 ?v4 ?v13) (pred_7 ))
:effect (and (pred_12 ?v4)
   (not (pred_2 ?v4 ?v13)) (not (pred_7 ))))


(:action op_2
:parameters (?v13 ?v11 ?v5)
:precondition (and (pred_9 ?v13) (pred_8 ?v11) (pred_8 ?v5)
                  (pred_6 ?v13) (pred_12 ?v5) (pred_2 ?v11 ?v13))
:effect (and (pred_12 ?v11) (pred_2 ?v5 ?v13)
        (not (pred_12 ?v5)) (not (pred_2 ?v11 ?v13))))

(:action op_3
:parameters (?v13 ?v4)
:precondition (and (pred_9 ?v13) (pred_8 ?v4) 
                  (pred_6 ?v13) (pred_12 ?v4))
:effect (and (pred_7 ) (pred_2 ?v4 ?v13) (not (pred_12 ?v4)))))


	
