(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_12 obj_01 obj_09 obj_05 - type_3
obj_03 obj_02 obj_06 - type_2
obj_11 obj_08 obj_07 - object)
(:init
(pred_3 obj_04 obj_03)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_01)
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_05)
(pred_2 obj_11 obj_03)
(pred_2 obj_08 obj_02)
(pred_2 obj_07 obj_03)
)
(:goal
(and
(pred_2 obj_11 obj_03)
(pred_2 obj_08 obj_06)
(pred_2 obj_07 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_02) (pred_3 obj_10 obj_02))))
  )
)
)