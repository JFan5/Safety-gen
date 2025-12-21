(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v4 ?v3)
             (pred_12 ?v11 ?v1)
             (pred_3 ?v4 ?v1)
             (pred_5 ?v6 ?v4 )
	     (pred_1 ?v4)
             (pred_7 ?v2)
             (pred_8 ?v11)
             (pred_9 ?v1)
             (pred_4 ?v4)
             (pred_10 ?v11)
             (pred_11 ?v4)
             (pred_6 ))



(:action op_5
:parameters (?v13 ?v12 ?v7 ?v10)
:precondition (and (pred_7 ?v13) (pred_7 ?v12) (pred_8 ?v7) (pred_9 ?v10)
          (pred_2 ?v13 ?v12) (pred_12 ?v7 ?v10)
                   (pred_3 ?v12 ?v10) (pred_1 ?v13) 
                   (pred_4 ?v12) (pred_10 ?v7))
:effect (and  (pred_11 ?v12) (not (pred_4 ?v12))))


(:action op_2
:parameters (?v13 ?v9)
:precondition (and (pred_7 ?v13) (pred_7 ?v9)
               (pred_1 ?v13) (pred_2 ?v13 ?v9) (pred_11 ?v9))
:effect (and (pred_1 ?v9) (not (pred_1 ?v13))))

(:action op_3
:parameters (?v13 ?v7)
:precondition (and (pred_7 ?v13) (pred_8 ?v7) 
                  (pred_1 ?v13) (pred_5 ?v7 ?v13) (pred_6 ))
:effect (and (pred_10 ?v7)
   (not (pred_5 ?v7 ?v13)) (not (pred_6 ))))


(:action op_1
:parameters (?v13 ?v8 ?v5)
:precondition (and (pred_7 ?v13) (pred_8 ?v8) (pred_8 ?v5)
                  (pred_1 ?v13) (pred_10 ?v5) (pred_5 ?v8 ?v13))
:effect (and (pred_10 ?v8) (pred_5 ?v5 ?v13)
        (not (pred_10 ?v5)) (not (pred_5 ?v8 ?v13))))

(:action op_4
:parameters (?v13 ?v7)
:precondition (and (pred_7 ?v13) (pred_8 ?v7) 
                  (pred_1 ?v13) (pred_10 ?v7))
:effect (and (pred_6 ) (pred_5 ?v7 ?v13) (not (pred_10 ?v7)))))


	
