(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_09 obj_05 obj_01 obj_10 - type_2
obj_11 obj_03 obj_02 - type_3
obj_07 obj_08 obj_12 - object)
(:init
(pred_1 obj_04 obj_11)
(pred_3 obj_04 obj_09)
(pred_3 obj_04 obj_05)
(pred_1 obj_06 obj_03)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_10)
(pred_2 obj_07 obj_11)
(pred_2 obj_08 obj_03)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_08 obj_02)
(pred_2 obj_12 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_02) (pred_1 obj_06 obj_02))))
  )
)
)