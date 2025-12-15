(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_07 - type_1
obj_02 obj_08 obj_01 obj_03 - type_3
obj_12 obj_11 obj_06 - type_2
obj_05 obj_09 obj_10 - object)
(:init
(pred_3 obj_04 obj_11)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_08)
(pred_3 obj_07 obj_12)
(pred_4 obj_07 obj_01)
(pred_4 obj_07 obj_03)
(pred_2 obj_05 obj_06)
(pred_2 obj_09 obj_06)
(pred_2 obj_10 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_11)
(pred_2 obj_09 obj_06)
(pred_2 obj_10 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_06) (pred_3 obj_07 obj_06))))
  )
)
)