(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_06 - type_1
obj_03 obj_02 obj_04 obj_09 - type_3
obj_11 obj_08 obj_10 - type_2
obj_05 obj_01 obj_12 - object)
(:init
(pred_3 obj_07 obj_08)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_02)
(pred_3 obj_06 obj_11)
(pred_4 obj_06 obj_04)
(pred_4 obj_06 obj_09)
(pred_2 obj_05 obj_11)
(pred_2 obj_01 obj_08)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_05 obj_08)
(pred_2 obj_01 obj_08)
(pred_2 obj_12 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_07 obj_08) (pred_3 obj_06 obj_08))))
  )
)
)