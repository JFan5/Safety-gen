(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_1
obj_01 obj_11 obj_13 obj_02 - type_2
obj_06 obj_09 obj_10 obj_04 - type_3
obj_05 obj_08 obj_12 - object)
(:init
(pred_3 obj_03 obj_06)
(pred_2 obj_03 obj_01)
(pred_2 obj_03 obj_11)
(pred_3 obj_07 obj_10)
(pred_2 obj_07 obj_13)
(pred_2 obj_07 obj_02)
(pred_1 obj_05 obj_06)
(pred_1 obj_08 obj_04)
(pred_1 obj_12 obj_10)
)
(:goal
(and
(pred_1 obj_05 obj_10)
(pred_1 obj_08 obj_09)
(pred_1 obj_12 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_04) (pred_3 obj_07 obj_04))))
  )
)
)