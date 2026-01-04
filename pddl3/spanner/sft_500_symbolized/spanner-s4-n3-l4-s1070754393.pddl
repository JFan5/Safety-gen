; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1070754393 --problem-name spanner-s4-n3-l4-s1070754393
(define (problem spanner-s4-n3-l4-s1070754393)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_13 obj_07 obj_04 obj_12 - type_3
     obj_02 obj_11 obj_14 - type_2
     obj_05 obj_08 obj_06 obj_09 - type_5
     obj_01 obj_10 - type_5
    )
 (:init 
    (pred_5 obj_03 obj_01)
    (pred_5 obj_13 obj_08)
    (pred_4 obj_13)
    (pred_5 obj_07 obj_08)
    (pred_4 obj_07)
    (pred_5 obj_04 obj_06)
    (pred_4 obj_04)
    (pred_5 obj_12 obj_05)
    (pred_4 obj_12)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_10)
    (pred_3 obj_11)
    (pred_5 obj_11 obj_10)
    (pred_3 obj_14)
    (pred_5 obj_14 obj_10)
    (pred_1 obj_01 obj_05)
    (pred_1 obj_09 obj_10)
    (pred_1 obj_05 obj_08)
    (pred_1 obj_08 obj_06)
    (pred_1 obj_06 obj_09)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_11)
   (pred_2 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
