(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_07 obj_04 obj_06 obj_09 - type_2
obj_02 obj_01 obj_05 obj_10 - type_3
obj_08 obj_11 obj_12 - object)
(:init
(pred_1 obj_03 obj_01)
(pred_3 obj_03 obj_07)
(pred_3 obj_03 obj_04)
(pred_1 obj_13 obj_10)
(pred_3 obj_13 obj_06)
(pred_3 obj_13 obj_09)
(pred_2 obj_08 obj_02)
(pred_2 obj_11 obj_01)
(pred_2 obj_12 obj_05)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_11 obj_05)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_05) (pred_1 obj_13 obj_05))))
  )
)
)