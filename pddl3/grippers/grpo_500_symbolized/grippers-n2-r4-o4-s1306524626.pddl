(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_1
obj_06 obj_04 obj_11 obj_03 - type_3
obj_02 obj_12 obj_14 obj_09 - type_2
obj_07 obj_01 obj_05 obj_10 - object)
(:init
(pred_4 obj_08 obj_02)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_04)
(pred_4 obj_13 obj_14)
(pred_2 obj_13 obj_11)
(pred_2 obj_13 obj_03)
(pred_3 obj_07 obj_14)
(pred_3 obj_01 obj_12)
(pred_3 obj_05 obj_12)
(pred_3 obj_10 obj_12)
)
(:goal
(and
(pred_3 obj_07 obj_12)
(pred_3 obj_01 obj_12)
(pred_3 obj_05 obj_02)
(pred_3 obj_10 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_12) (pred_4 obj_13 obj_12))))
  )
)
)