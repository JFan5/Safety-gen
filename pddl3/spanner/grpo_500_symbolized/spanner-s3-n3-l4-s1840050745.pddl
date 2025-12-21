; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1840050745 --problem-name spanner-s3-n3-l4-s1840050745
(define (problem spanner-s3-n3-l4-s1840050745)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_10 obj_01 obj_05 - type_3
     obj_06 obj_02 obj_11 - type_1
     obj_08 obj_07 obj_03 obj_13 - type_2
     obj_04 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_04)
    (pred_6 obj_10 obj_03)
    (pred_5 obj_10)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_01)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_12)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_12)
    (pred_3 obj_04 obj_08)
    (pred_3 obj_13 obj_12)
    (pred_3 obj_08 obj_07)
    (pred_3 obj_07 obj_03)
    (pred_3 obj_03 obj_13)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_02)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
