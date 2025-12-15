(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_3
obj_06 obj_05 obj_01 obj_03 - type_1
obj_07 obj_02 obj_09 obj_13 - type_2
obj_12 obj_11 obj_10 obj_14 - object)
(:init
(pred_3 obj_08 obj_13)
(pred_1 obj_08 obj_06)
(pred_1 obj_08 obj_05)
(pred_3 obj_04 obj_02)
(pred_1 obj_04 obj_01)
(pred_1 obj_04 obj_03)
(pred_2 obj_12 obj_13)
(pred_2 obj_11 obj_07)
(pred_2 obj_10 obj_09)
(pred_2 obj_14 obj_02)
)
(:goal
(and
(pred_2 obj_12 obj_02)
(pred_2 obj_11 obj_07)
(pred_2 obj_10 obj_02)
(pred_2 obj_14 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_13) (pred_3 obj_04 obj_13))))
  )
)
)