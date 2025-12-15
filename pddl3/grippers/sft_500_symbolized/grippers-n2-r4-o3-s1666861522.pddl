(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_12 - type_3
obj_04 obj_13 obj_10 obj_07 - type_2
obj_05 obj_01 obj_09 obj_03 - type_1
obj_08 obj_02 obj_06 - object)
(:init
(pred_3 obj_11 obj_03)
(pred_2 obj_11 obj_04)
(pred_2 obj_11 obj_13)
(pred_3 obj_12 obj_05)
(pred_2 obj_12 obj_10)
(pred_2 obj_12 obj_07)
(pred_1 obj_08 obj_01)
(pred_1 obj_02 obj_09)
(pred_1 obj_06 obj_03)
)
(:goal
(and
(pred_1 obj_08 obj_05)
(pred_1 obj_02 obj_09)
(pred_1 obj_06 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_05) (pred_3 obj_12 obj_05))))
  )
)
)