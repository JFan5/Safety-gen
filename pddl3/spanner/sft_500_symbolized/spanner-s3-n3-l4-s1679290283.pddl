; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1679290283 --problem-name spanner-s3-n3-l4-s1679290283
(define (problem spanner-s3-n3-l4-s1679290283)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_07 obj_03 obj_08 - type_3
     obj_02 obj_12 obj_11 - type_1
     obj_09 obj_05 obj_04 obj_01 - type_4
     obj_10 obj_13 - type_4
    )
 (:init 
    (pred_3 obj_06 obj_10)
    (pred_3 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_3 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_3 obj_08 obj_05)
    (pred_5 obj_08)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_13)
    (pred_2 obj_12)
    (pred_3 obj_12 obj_13)
    (pred_2 obj_11)
    (pred_3 obj_11 obj_13)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_01 obj_13)
    (pred_4 obj_09 obj_05)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_04 obj_01)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_12)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
