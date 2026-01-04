(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_3
obj_06 obj_01 obj_09 obj_08 - type_2
obj_07 obj_04 obj_11 obj_02 - type_1
obj_13 obj_12 obj_05 - object)
(:init
(pred_2 obj_10 obj_07)
(pred_3 obj_10 obj_06)
(pred_3 obj_10 obj_01)
(pred_2 obj_03 obj_11)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_08)
(pred_4 obj_13 obj_02)
(pred_4 obj_12 obj_04)
(pred_4 obj_05 obj_07)
)
(:goal
(and
(pred_4 obj_13 obj_02)
(pred_4 obj_12 obj_02)
(pred_4 obj_05 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_02) (pred_2 obj_03 obj_02))))
  )
)
)