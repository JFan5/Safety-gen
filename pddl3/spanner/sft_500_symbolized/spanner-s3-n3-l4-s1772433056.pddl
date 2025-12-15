; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1772433056 --problem-name spanner-s3-n3-l4-s1772433056
(define (problem spanner-s3-n3-l4-s1772433056)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_13 obj_03 obj_05 - type_5
     obj_02 obj_04 obj_11 - type_2
     obj_10 obj_06 obj_08 obj_12 - type_1
     obj_07 obj_01 - type_1
    )
 (:init 
    (pred_4 obj_09 obj_07)
    (pred_4 obj_13 obj_12)
    (pred_5 obj_13)
    (pred_4 obj_03 obj_12)
    (pred_5 obj_03)
    (pred_4 obj_05 obj_12)
    (pred_5 obj_05)
    (pred_1 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_1 obj_04)
    (pred_4 obj_04 obj_01)
    (pred_1 obj_11)
    (pred_4 obj_11 obj_01)
    (pred_2 obj_07 obj_10)
    (pred_2 obj_12 obj_01)
    (pred_2 obj_10 obj_06)
    (pred_2 obj_06 obj_08)
    (pred_2 obj_08 obj_12)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_04)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_07)))
  )
)
)
