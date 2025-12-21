(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_1
obj_10 obj_09 obj_03 obj_07 - type_3
obj_01 obj_04 obj_02 - type_2
obj_08 obj_06 obj_11 - object)
(:init
(pred_4 obj_05 obj_01)
(pred_2 obj_05 obj_10)
(pred_2 obj_05 obj_09)
(pred_4 obj_12 obj_02)
(pred_2 obj_12 obj_03)
(pred_2 obj_12 obj_07)
(pred_3 obj_08 obj_02)
(pred_3 obj_06 obj_04)
(pred_3 obj_11 obj_01)
)
(:goal
(and
(pred_3 obj_08 obj_04)
(pred_3 obj_06 obj_02)
(pred_3 obj_11 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_02) (pred_4 obj_12 obj_02))))
  )
)
)