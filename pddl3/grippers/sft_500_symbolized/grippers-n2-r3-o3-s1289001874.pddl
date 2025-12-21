(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_1
obj_04 obj_01 obj_07 obj_06 - type_2
obj_09 obj_02 obj_10 - type_3
obj_12 obj_08 obj_05 - object)
(:init
(pred_1 obj_03 obj_10)
(pred_3 obj_03 obj_04)
(pred_3 obj_03 obj_01)
(pred_1 obj_11 obj_09)
(pred_3 obj_11 obj_07)
(pred_3 obj_11 obj_06)
(pred_2 obj_12 obj_02)
(pred_2 obj_08 obj_09)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_12 obj_09)
(pred_2 obj_08 obj_09)
(pred_2 obj_05 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_02) (pred_1 obj_11 obj_02))))
  )
)
)