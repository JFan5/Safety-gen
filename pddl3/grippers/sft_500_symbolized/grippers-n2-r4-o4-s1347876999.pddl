(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_01 - type_1
obj_12 obj_06 obj_14 obj_08 - type_2
obj_10 obj_04 obj_11 obj_02 - type_3
obj_13 obj_03 obj_09 obj_07 - object)
(:init
(pred_1 obj_05 obj_11)
(pred_3 obj_05 obj_12)
(pred_3 obj_05 obj_06)
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_14)
(pred_3 obj_01 obj_08)
(pred_2 obj_13 obj_02)
(pred_2 obj_03 obj_10)
(pred_2 obj_09 obj_02)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_13 obj_04)
(pred_2 obj_03 obj_04)
(pred_2 obj_09 obj_10)
(pred_2 obj_07 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_02) (pred_1 obj_01 obj_02))))
  )
)
)