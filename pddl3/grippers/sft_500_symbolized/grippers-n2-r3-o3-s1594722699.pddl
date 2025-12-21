(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_09 obj_06 obj_11 obj_02 - type_2
obj_03 obj_05 obj_04 - type_3
obj_01 obj_08 obj_10 - object)
(:init
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_06)
(pred_1 obj_12 obj_05)
(pred_3 obj_12 obj_11)
(pred_3 obj_12 obj_02)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_03)
(pred_2 obj_10 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_05)
(pred_2 obj_10 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_05) (pred_1 obj_12 obj_05))))
  )
)
)