(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_09 obj_04 obj_08 obj_01 - type_3
obj_13 obj_10 obj_02 obj_05 - type_2
obj_03 obj_12 obj_06 - object)
(:init
(pred_4 obj_07 obj_13)
(pred_2 obj_07 obj_09)
(pred_2 obj_07 obj_04)
(pred_4 obj_11 obj_02)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_01)
(pred_3 obj_03 obj_10)
(pred_3 obj_12 obj_10)
(pred_3 obj_06 obj_05)
)
(:goal
(and
(pred_3 obj_03 obj_05)
(pred_3 obj_12 obj_10)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_05) (pred_4 obj_11 obj_05))))
  )
)
)