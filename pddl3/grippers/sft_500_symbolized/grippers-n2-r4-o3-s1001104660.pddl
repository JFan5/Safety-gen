(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_1
obj_04 obj_10 obj_09 obj_06 - type_2
obj_11 obj_05 obj_03 obj_12 - type_3
obj_08 obj_07 obj_02 - object)
(:init
(pred_1 obj_01 obj_05)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_10)
(pred_1 obj_13 obj_12)
(pred_3 obj_13 obj_09)
(pred_3 obj_13 obj_06)
(pred_2 obj_08 obj_03)
(pred_2 obj_07 obj_11)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_07 obj_05)
(pred_2 obj_02 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_01 obj_05) (pred_1 obj_13 obj_05))))
    (always (not (and (pred_1 obj_01 obj_03) (pred_1 obj_13 obj_03))))
  )
)
)