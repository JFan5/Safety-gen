(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_1
obj_12 obj_09 obj_04 obj_10 - type_3
obj_01 obj_11 obj_02 obj_08 - type_2
obj_05 obj_13 obj_06 - object)
(:init
(pred_4 obj_03 obj_02)
(pred_2 obj_03 obj_12)
(pred_2 obj_03 obj_09)
(pred_4 obj_07 obj_01)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_10)
(pred_3 obj_05 obj_11)
(pred_3 obj_13 obj_01)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_11)
(pred_3 obj_13 obj_02)
(pred_3 obj_06 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_02) (pred_4 obj_07 obj_02))))
  )
)
)