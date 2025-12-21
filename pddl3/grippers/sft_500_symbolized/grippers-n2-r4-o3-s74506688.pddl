(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_07 - type_1
obj_05 obj_10 obj_06 obj_12 - type_2
obj_08 obj_09 obj_03 obj_04 - type_3
obj_02 obj_13 obj_01 - object)
(:init
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_10)
(pred_1 obj_07 obj_09)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_12)
(pred_2 obj_02 obj_08)
(pred_2 obj_13 obj_09)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_13 obj_04)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_04) (pred_1 obj_07 obj_04))))
  )
)
)