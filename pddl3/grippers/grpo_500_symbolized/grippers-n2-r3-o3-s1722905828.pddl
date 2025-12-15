(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_06 obj_10 obj_09 obj_01 - type_3
obj_11 obj_03 obj_04 - type_2
obj_02 obj_05 obj_08 - object)
(:init
(pred_3 obj_12 obj_04)
(pred_4 obj_12 obj_06)
(pred_4 obj_12 obj_10)
(pred_3 obj_07 obj_11)
(pred_4 obj_07 obj_09)
(pred_4 obj_07 obj_01)
(pred_2 obj_02 obj_03)
(pred_2 obj_05 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_08 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_04) (pred_3 obj_07 obj_04))))
  )
)
)