(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_07 - type_1
obj_09 obj_05 obj_08 obj_01 - type_3
obj_10 obj_04 obj_02 - type_2
obj_03 obj_06 obj_12 - object)
(:init
(pred_3 obj_11 obj_04)
(pred_4 obj_11 obj_09)
(pred_4 obj_11 obj_05)
(pred_3 obj_07 obj_10)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_01)
(pred_2 obj_03 obj_10)
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_06 obj_10)
(pred_2 obj_12 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_04) (pred_3 obj_07 obj_04))))
  )
)
)